#include<cstdio>
#include<iostream>
#include<cmath>
#include<algorithm>
#define LL long long

using namespace std;
int main()
{
    //freopen("in.txt","r",stdin);
   // freopen("out.txt","w",stdout);
    string s;
    while(cin>>s)
    {
        sort(s.begin(),s.end());
        cout<<s<<endl;
    }

    return 0;
}
