#include<iostream>
#include<cstdio>
using namespace std;
int main()
{
    int a[]={0,1500,4500,9000,35000,55000,80000};
    int b[]={0,3,10,20,25,30,35,45};
    int n;
    cin>>n;
    if(n<=3500)
    {
        printf("%.2lf\n",0.0);
        return 0;
    }
    n-=3500;
    double ans=0.0;
    for(int i=1;i<=6;i++)
    {
        if(n<=a[i])
        {
            ans+=1.0*(n-a[i-1])*b[i]/100;
            break;
        }
        else ans+=1.0*(a[i]-a[i-1])*b[i]/100;

    }
    if(n>a[6]) ans+=1.0*(n-a[6])*b[7]/100;
    printf("%.2lf\n",ans);
    return 0;
}
