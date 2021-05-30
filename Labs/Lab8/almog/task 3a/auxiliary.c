#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <elf.h>
#include <fcntl.h>
#include <sys/mman.h>
       //#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>


#define  NAME_LEN  128
#define  BUF_SZ    10000

typedef struct {
    char debug_mode;
    char file_name[NAME_LEN];
    int unit_size;
    unsigned char mem_buf[BUF_SZ];
    size_t mem_count;

    //Lab 8
    int Currentfd;
    void* map_start;
    struct stat fd_stat;
    Elf32_Ehdr * header;
    int num_of_section_headers;
    

} state;


struct fun_desc {       // Definition of the struct.
    char* name;
    void (*fun)(void * L);      // This is the pointer to the function, which gets a char as an argument.
};

void debug_mode(state* s);
void exm_elf_file(state* s);
void print_sec_names(state* s);
void print_sym(state* s);
void rel_tab(state* s);
void quit(state* s);

void beforExam(state * s);
void afterExam(state * s);
void printShtab(state * s);
void printSymtab(state * s);
char * getSecHeadName(state * s , int index);
char * getSymName(state * s , int index);
void printRelTab(Elf32_Shdr * h, state * s);
void printRelaTab(Elf32_Shdr * h, state * s);
Elf32_Shdr * findSymtab(state * s);

void debug_mode(state* s){
  if(s->debug_mode == 0){
    s->debug_mode = 1;
    printf("Debug flag now on\n");
  }else
  {
    s->debug_mode = 0;
    printf("Debug flag now off\n");
  }
}

void exm_elf_file(state* s){
  printf("Enter ELF file name to be examine\n");
  char str[100];
  fgets(str,100,stdin);
  sscanf(str,"%s",s->file_name);

  beforExam(s);
  
  printf("ELF Header:\n");
  printf("  %-8s:%-3X%-3X%-3X%-3X\n" ,"Magic",s->header->e_ident[EI_MAG0], s->header->e_ident[EI_MAG1], s->header->e_ident[EI_MAG2], s->header->e_ident[EI_MAG3]);
  switch (s->header->e_ident[EI_DATA])
  {
  case ELFDATANONE:
    printf("  %-35s%s\n" , "Data:","ELFDATANONE");
    break;
  case ELFDATA2LSB:
    printf("  %-35s%s\n" , "Data:","ELFDATA2LSB");
    break;
  case ELFDATA2MSB:
    printf("  %-35s%s\n" , "Data:","ELFDATA2MSB");
    break;
  }
  
  printf("  %-35s%X\n" , "Entry point:", s->header->e_entry);
  printf("  %-35s%d bytes\n" , "Start of section header:", s->header->e_shoff);
  printf("  %-35s%d bytes\n" , "Number of section headers:" , s->header->e_shnum);
  printf("  %-35s%d bytes\n" , "Start of program header:" , s->header->e_phoff);
  printf("  %-35s%d bytes\n" , "Number of program headers:" , s->header->e_phnum);
  printf("  %-35s%d bytes\n" , "Size of section headers:" , s->header->e_shentsize);
  printf("  %-35s%d bytes\n" , "Size of program headers:" , s->header->e_phentsize);

  if(s->debug_mode == 1){
    printf("  %-35s%d bytes\n" , "Section header string table index:" , s->header->e_shstrndx);
    Elf32_Shdr * symtab = (Elf32_Shdr *)(s->map_start + s->header->e_shoff) + s->header->e_shnum - 2;
    Elf32_Off sym_off = symtab->sh_offset;
    Elf32_Sym * sym_tab = (Elf32_Sym *)(s->map_start + sym_off);
    int num_of_sym = (symtab->sh_size)/sizeof(Elf32_Sym);
    printf("  %-35s%d bytes\n" , "Size of symbols:" , sizeof(Elf32_Sym));
    printf("  %-35s%d\n" , "Number of symbols:" , num_of_sym);

  }

  
  
  
}


void print_sec_names(state* s){
  printShtab(s);
}

void print_sym(state* s){
  printSymtab(s);
}

void rel_tab(state* s){
  Elf32_Shdr * sheader = (Elf32_Shdr *)(s->map_start + s->header->e_shoff);
  char check = 0;
  for(int i = 0; i < s->header->e_shnum; i++){
    if(sheader->sh_type == SHT_REL | sheader->sh_type == SHT_RELA){
      if(check == 0){
        check = 1;
        printf("\nRelocation table:\n");
        printf("  %-8s%s\n", "Offset", "Info");
      }
      if(sheader->sh_type == SHT_REL){ printRelTab(sheader,s); }
      else{ printRelaTab(sheader,s); }
    }
    sheader += 1;
  }
}

void quit(state* s){
  afterExam(s);
    if(s->debug_mode == 1){
      printf("quitting\n");
    }
    free(s);
    exit(0);
}

void beforExam(state * s){
  if(s->Currentfd != -1){
    if( (close(s->Currentfd)) != 0 ) {
      perror("error in close");
      exit(-1);
    }
  }
  if( (s->Currentfd = open(s->file_name, O_RDWR)) < 0 ) {
    perror("error in open");
    exit(-1);
  }

  if( fstat(s->Currentfd, &s->fd_stat) != 0 ) {
    perror("stat failed");
    exit(-1);
  }

  if ( (s->map_start = mmap(0, s->fd_stat.st_size, PROT_READ | PROT_WRITE , MAP_SHARED, s->Currentfd, 0)) == MAP_FAILED ) {
    perror("mmap failed");
    exit(-4);
  }
  s->header = (Elf32_Ehdr *) s->map_start;
}
void afterExam(state * s){
  if(munmap(s->map_start, s->fd_stat.st_size) < 0){
    perror("munmap failed");
    exit(-4);
  }

  if( (s->Currentfd = close(s->Currentfd)) < 0 ) {
    perror("error in close");
    exit(-1);
  }

  s->Currentfd = -1;
}
void printShtab(state * s){
  Elf32_Shdr * sheader = (Elf32_Shdr *)(s->map_start + s->header->e_shoff);
  printf("\nSection Headers:\n");
  printf("  %-7s%-20s%-13s%-9s%-8s%-8s\n", "[Nr]", "Name","Type","Addr","Off","Size");

  for(int i = 0; i < s->header->e_shnum; i++){
    printf("  [%2d%-4c%-20s%-13X%-9X%-8X%-8X\n",i ,']', getSecHeadName(s, sheader->sh_name), sheader->sh_type,sheader->sh_addr,
    sheader->sh_offset,sheader->sh_size);
    sheader += 1;
  }
}
void printSymtab(state * s){
  Elf32_Shdr * symtab = findSymtab(s);
  Elf32_Off sym_off = symtab->sh_offset;
  Elf32_Sym * sym_tab = (Elf32_Sym *)(s->map_start + sym_off);
  int num_of_sym = (symtab->sh_size)/sizeof(Elf32_Sym);

  printf("\nSymbol table:\n");
  printf("  %-6s%-9s%-5s%-15s%-8s\n", "Num", "Value","Ndx","Section Name","Symbol Name");

  int sh_nameInd;
  for(int i = 0; i < num_of_sym; i++){
    if(sym_tab->st_shndx == 0xfff1){ sh_nameInd = 0;}
    else{
      Elf32_Shdr * currentsh = (Elf32_Shdr *)(s->map_start + s->header->e_shoff) + sym_tab->st_shndx;
      sh_nameInd = currentsh->sh_name;
    }
    printf("  %2d%-4c%-9X%-5d%-15s%-8s\n",i ,':', sym_tab->st_value, sym_tab->st_shndx,getSecHeadName(s,sh_nameInd),
    getSymName(s, sym_tab->st_name));
    sym_tab += 1;
  }
}
Elf32_Shdr * findSymtab(state * s){
  Elf32_Shdr * sheader = (Elf32_Shdr *)(s->map_start + s->header->e_shoff);
  for(int i = 0; i < s->header->e_shnum; i++){
    if(sheader->sh_type == SHT_SYMTAB){ return sheader; }
    sheader += 1;
  }
}

char * getSecHeadName(state * s , int index){
  Elf32_Shdr * sheader = (Elf32_Shdr *)(s->map_start + s->header->e_shoff);

  Elf32_Shdr * shstr_tab = (Elf32_Shdr *)(s->map_start + s->header->e_shoff) + s->header->e_shnum - 3;
  Elf32_Off shstr_off = shstr_tab->sh_offset;
  char * sh_name = (s->map_start + shstr_off + index);
  return sh_name;
}
char * getSymName(state * s , int index){
  //Elf32_Shdr * sheader = (Elf32_Shdr *)(s->map_start + s->header->e_shoff);
  //Elf32_Shdr * symtab = (Elf32_Shdr *)(s->map_start + s->header->e_shoff) + s->header->e_shnum - 2;
  //Elf32_Off sym_off = symtab->sh_offset;

  Elf32_Shdr * strtab = (Elf32_Shdr *)(s->map_start + s->header->e_shoff) + s->header->e_shnum - 1;
  Elf32_Off str_off = strtab->sh_offset;

  //Elf32_Sym * sym_tab = (Elf32_Sym *)(s->map_start + sym_off);
  //Elf32_Shdr * currentsh = (Elf32_Shdr *)(s->map_start + s->header->e_shoff) + index - 1;
  //Elf32_Off currentsh_off = currentsh->sh_offset;
  char * st_name = (s->map_start + str_off + index);
  return st_name;
}
void printRelTab(Elf32_Shdr * h, state * s){
  Elf32_Rel * rel = (Elf32_Rel *)(s->map_start + h->sh_offset);
  int num_of_rel = (h->sh_size)/sizeof(Elf32_Rel);
  for (int i = 0; i < num_of_rel; i++)
  {
    printf("  %-8X%X\n", rel->r_offset, rel->r_info);
    rel += 1;
  }
}
void printRelaTab(Elf32_Shdr * h, state * s){
  Elf32_Rela * rela = (Elf32_Rela *)(s->map_start + h->sh_offset);
  int num_of_rela = (h->sh_size)/sizeof(Elf32_Rela);
  for (int i = 0; i < num_of_rela; i++)
  {
    printf("  %-8X%X\n", rela->r_offset, rela->r_info);
    rela += 1;
  }
}