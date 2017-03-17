#include<cstdio>
#include<iostream>
#define LL long long
using namespace std;
int n;
int a[1005][1005];
int main()
{
    //freopen("in.txt","r",stdin);
  //  freopen("out.txt","w",stdout);
    //string s;


    while(cin>>n)
    {
        for(int i=0;i<n;i++)
            for(int j=0;j<n;j++)
            {
                cin>>a[i][j];
                if(j>=i) a[i][j]=0;
            }
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<n-1;j++)
                cout<<a[i][j]<<" ";
            cout<<a[i][n-1]<<endl;
        }

    }

    return 0;
}
