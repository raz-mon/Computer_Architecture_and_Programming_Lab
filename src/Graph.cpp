//
// Created by spl211 on 03/11/2020.
//

#include "../include/Graph.h"
#include <string>
#include <iostream>

using namespace std;

Graph::Graph():edges(), nodesStatus(){}

Graph::Graph(std::vector<std::vector<int>> matrix): edges(matrix), nodesStatus(){
    for(uint i = 0;i < edges.size(); ++i){
        nodesStatus.push_back(H);
    }
}

Status Graph::getStatus(int node){
    return nodesStatus[node];
}

void Graph::setStatus(int node, Status sts) {
    this->nodesStatus[node] = sts;
}

// Build connectivity components and check for solidarity among them.
bool Graph::finish() {
    bool ans = true;
    for (uint i = 0; i < edges.size(); ++i) {
        Status currNodeStatus = nodesStatus[i];
        for (uint j = 0; (j < edges.size()) & (ans); ++j) {
            if ((i != j) & (edges[i][j] == 1) & (currNodeStatus != nodesStatus[j])) {
                ans = false;
            }
        }
    }
    return ans;
}

// closestNode searching for the closest node to be infected by the virus.
int Graph::closestNode(int node){
    for(uint i = 0; i < nodesStatus.size(); ++i){
        if(edges[node][i] == 1){
            if(nodesStatus[i] == H)
                return (int)i;
        }
    }
    return -1;
}

void Graph::infectNode(int nodeInd){
    this->nodesStatus[nodeInd] = I;
}

bool Graph::isInfected(int nodeInd) {
    return nodesStatus[nodeInd] == I;
}

int Graph::getSize(){
    return edges.size();
}

bool Graph::hasEdge(int i, int j){
    return edges[i][j]==1;
}

void Graph::isolate(int toIsolate){
    for (uint i=0; i<this->edges.size(); ++i){
        if (edges[toIsolate][i]==1){
            edges[toIsolate][i]=0;
            edges[i][toIsolate]=0;
        }
    }
}

vector<vector<int>> Graph::getEdges() const{
    return this->edges;
}

vector<Status> Graph::getNodesStatus() const{
    return nodesStatus;
}