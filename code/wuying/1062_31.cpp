#include<iostream>
#include<algorithm>
#include<map>
using namespace std;
int main()
{
    int n,m,x;
    map<int,int>s,e;
    cin>>n;
    for(int i=1;i<=n;i++)
    {
        cin>>x;
        if(s[x]==0) s[x]=e[x]=i;
        else s[x]=min(s[x],i),e[x]=max(e[x],i);
    }
    cin>>m;
    for(int i=1;i<=m;i++)
    {
        cin>>x;
        if(s[x]==0) cout<<-1<<" "<<-1<<endl;
        else cout<<s[x]<<" "<<e[x]<<endl;
    }
    return 0;
}
