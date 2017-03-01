#include<cstdio>
void dfs(int n,char a,char b,char c)
{
    if(n==1)
    {
        printf("Move %c to %c\n",a,c);
        return ;
    }
    dfs(n-1,a,c,b);
    printf("Move %c to %c\n",a,c);
    dfs(n-1,b,a,c);
}
int main()
{
    int n;
    scanf("%d",&n);
    printf("%d\n",(1<<n)-1);
    dfs(n,'A','B','C');
    return 0;
}
