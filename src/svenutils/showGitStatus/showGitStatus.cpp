#include <iostream>
#include <string>
#include <vector>

using namespace std;

void find_git_repository(string &path, vector<string> &git_repos) {
    for (auto &p : fs::recursive_directory_iterator(path)) {
        if (p.path().filename() == ".git") {
            git_repos.push_back(p.path().parent_path());
        }
    }