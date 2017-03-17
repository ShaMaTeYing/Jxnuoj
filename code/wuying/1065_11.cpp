#include<iostream>
using namespace std;
string s;
int judge(int Start,int End,char c)
{
    for(int i=Start;i<End;i++)
        if(s[i]==c) return i;
    return -1;
}
int main()
{
    int f=0;
    cin>>s;
    int a[10];
    a[0]=-1;
    string str="hello";
    for(int i=0;i<str.size();i++)
    {
       a[i+1]=judge(a[i]+1,s.size()-1,str[i]);
    }
    for(int i=1;i<=5;i++)
        if(a[i]==-1) f=1;
    if(f) cout<<"NO"<<endl;
    else cout<<"YES"<<endl;
    return 0;
}
