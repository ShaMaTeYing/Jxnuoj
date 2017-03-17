#include<cstdio>
#include<iostream>
#define LL long long
using namespace std;
int n;
double a;
int main()
{
   // freopen("in.txt","r",stdin);
    //freopen("out.txt","w",stdout);
    //string s;


    while(cin>>n)
    {
        cin>>a;
        double sum=a,Max=a,Min=a;
        for(int i=1;i<n;i++)
        {
            cin>>a;
            sum+=a;
            Max=max(Max,a);
            Min=min(Min,a);
        }
        printf("%.2lf\n",(sum-Max-Min)/(n-2));
    }

    return 0;
}
