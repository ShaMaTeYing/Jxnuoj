#include <stdio.h>
#include <algorithm>
using namespace std;
int n,i,p[1001],a[1001];
int main()
{
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		scanf("%d",&p[i]);
		a[i]=p[i];
	}
	next_permutation(p,p+n);
	int f=1;
	for(i=0;i<n;i++)
	{
		if(p[i]>a[i])
		{
		    f=0;
			printf("Yes\n");
			break;
		}
		if(p[i]<a[i])
		{
		    f=0;
			printf("No\n");
			break;
		}
	}
	if(f)
    {
        printf("No\n");
        sort(p,p+n);
    }
	for(i=0;i<n;i++)
	{
		printf("%d ",p[i]);
	}
	return 0;
}
