#include<cstdio>
char a[8][10]={"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int main()
{
    int k;
    scanf("%d",&k);
    if(k<1||k>7) puts("Invalid");
    else puts(a[k-1]);
	return 0;
}
