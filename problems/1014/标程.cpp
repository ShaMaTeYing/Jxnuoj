#include<cstdio>
#include<iostream>
#include<cmath>
#include<algorithm>
#define LL long long

using namespace std;
int a[255][255];
int main()
{
    //freopen("in.txt","r",stdin);
   // freopen("out.txt","w",stdout);
    int n;
    while(cin>>n)
    {
        int cnt=1,i=1,j=(n+1)/2;
        while(cnt<=n*n)
        {
            a[i][j]=cnt;
            if(cnt%n==0) i++;
            else
            {
                i--;j++;
                if(i==0) i=n;
                if(j>n) j=1;
            }
            cnt++;
        }
        for(int i=1;i<=n;i++)
        {
            for(int j=1;j<n;j++)
                cout<<a[i][j]<<" ";
            cout<<a[i][n]<<endl;
        }
    }
    return 0;
}
