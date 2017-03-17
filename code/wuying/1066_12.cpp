#include<iostream>
#include<algorithm>
using namespace std;
bool cmp(string a,string b)
{
    if(a.size()>b.size()) return false;
    else if(a.size()==b.size())
    {
        if(a>=b) return false;
    }
    return true;
}
int main()
{
    string s[105];
    int n;
    cin>>n;
    for(int i=0;i<n;i++) cin>>s[i];
    sort(s,s+n,cmp);
    for(int i=0;i<n;i++) cout<<s[i]<<" ";
    return 0;
}
