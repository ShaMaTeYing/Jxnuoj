#include<cstdio>
int main()
{
	int n,a;
    scanf("%d%d",&n,&a);
    if(a<10)
    {
    	for(int i=9;a!=0;i--)
        {
            a--;
        	for(int j=1;j<=n-1;j++) printf("%d",9);
            printf("%d\n",i);
        }
    }
    else if(a<100)
    {
    	for(int i=99;a;i--,a--)
        {
        	for(int j=1;j<=n-2;j++) printf("%d",9);
            printf("%02d\n",i);
        }
    }
    else
    {
    	for(int i=999;a;i--,a--)
        {
        	for(int j=1;j<=n-3;j++) printf("%d",9);
            printf("%03d\n",i);
        }
    }
	return 0;
}
