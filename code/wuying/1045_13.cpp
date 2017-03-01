#include <iostream>
#include<bits/stdc++.h>
#define N 100000010
using namespace std;

bool d[N];

void init()
{
    int i=0;
    while(1)
    {
        int t=i*(i+1)/2+1;
        if(t>=N)    break;
        d[t]=1;
        i++;
    }
}

int main()
{
    init();
    while(~scanf("%d",&n))
    {
        int n;
        cout<<d[n]<<endl;
    }
}
