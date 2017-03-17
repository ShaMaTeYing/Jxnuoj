#include<cstdio>
#include<iostream>
#include<cmath>
#include<algorithm>
#define LL long long

using namespace std;
int main()
{
    freopen("in.txt","r",stdin);
    freopen("out.txt","w",stdout);
    for(int i=2;i<=1000;i++)
    {
        int sum=0;
        for(int j=1;j<i;j++)
            if(i%j==0) sum+=j;
        if(sum==i) cout<<i<<endl;
    }

    return 0;
}
