#include <stdio.h>
#include <algorithm>
using namespace std;
int n,i,a[8];
int main()
{
	scanf("%d",&n);
	for(i=1;i<=n;i++)
	{
		a[i]=i;
	}
	while(next_permutation(a+1,a+n+1))
	{
		for(i=1;i<=n;i++)
		{
			printf("%d ",a[i]);
		}
		printf("\n");
	}
}
