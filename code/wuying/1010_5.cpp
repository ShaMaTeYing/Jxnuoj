#include<iostream>
#include<cstdio>
using namespace std;
int main()
{
    string s;
    int t;
    cin>>t;
    while(t--)
    {
        cin>>s;
        long long cnt=0,ans=0;
        for(int i=0;i<s.size();i++)
        {
            if(s[i]=='q') cnt++;
            else
            {
                ans+=cnt*(cnt+1)/2;
                cnt=0;
            }
        }
        ans+=cnt*(cnt+1)/2;
        cout<<ans<<endl;
    }
    return 0;
}
