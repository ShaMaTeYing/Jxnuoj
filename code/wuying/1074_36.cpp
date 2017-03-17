#include<cstdio>
char a[8][3]={"Su","Mo","Tu","We","Th","Fr","Sa"};
int main()
{

    int n,k;
    scanf("%d%d",&n,&k);
    for(int i=0;i<6;i++)
        printf("%s\t",a[i]);
    printf("%s\n",a[6]);
    int cnt=0,p=1;
    for(int i=0;i<k;i++) printf("\t"),cnt++;
    while(n--)
    {
        cnt++;
        printf("%d",p++);
        if(cnt%7==0) printf("\n");
        else printf("\t");
    }
	return 0;
}
