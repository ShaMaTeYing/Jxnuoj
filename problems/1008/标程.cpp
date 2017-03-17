#include<cstdio>
#include<iostream>
#define LL long long
using namespace std;
int n;
bool judge(int n)
{
    if(n<2) return false;
    for(int i=2;i*i<=n;i++)
        if(n%i==0) return false;
    return true;
}
int main()
{
   // freopen("in.txt","r",stdin);
  //  freopen("out.txt","w",stdout);
    //string s;


    while(cin>>n)
    {
        int ans=0;
        for(int i=0;i<n;i++)
        {
            int a;
            cin>>a;
            if(judge(a) ) ans++;
        }
        cout<<ans<<endl;

    }

    return 0;
}
