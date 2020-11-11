#ifndef SESSION_H_
#define SESSION_H_

#include <vector>
#include <string>
#include "Graph.h"

using namespace std;

class Agent;

enum TreeType{
  Cycle,
  MaxRank,
  Root
};

class Session{
public:
    Session(const std::string& path);

    //not in original
    Session();

    void simulate();
    void addAgent(const Agent& agent);
    void setGraph(const Graph& graph);
    //Trace function for ContactTracer - act()
    //Rule of 3:
    virtual ~Session();
    Session(const Session &otherSess);
    Session & operator=(const Session &otherSess);


    void enqueueInfected(int);
    int dequeueInfected();
    TreeType getTreeType() const;


    //Almog adds-on: new functions
    Graph& getGraph();
    int getCycle() const;
    void outputConfig();
    void Test1();   //Test for MaxRankTree - trace tree

private:
    Graph g;
    TreeType treeType;
    std::vector<Agent*> agents;
    vector<int> InfectedQueue;
    int cycle;
};

#endif
