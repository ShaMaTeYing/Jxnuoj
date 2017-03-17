#include <iostream>
#include <stack>
#include<algorithm>
using namespace std;

stack <int>s_data;
stack <char>s_signal;
int cnt=0;
int priority(char c){
    int pr = 0;
    switch(c){
        case '#': pr = -1;break;
        case '+':
        case '-': pr = 1;break;
        case '*':
        case '/': pr = 2;break;
    }
    return pr;
}
void execution(){
    int tempA,tempB,temp;
    char operation;
    tempB = s_data.top();
    s_data.pop();
    tempA = s_data.top();
    s_data.pop();
    operation = s_signal.top();
    s_signal.pop();
    if(operation == '*')
        temp = tempA * tempB;
    else if(operation == '/')
        {

            temp = tempA / tempB;
        }
    else if(operation == '+')
        temp = tempA + tempB;
    else if(operation == '-')
        temp = tempA - tempB;
    s_data.push(temp);
}
int solve(string str)
{
     while(!s_data.empty())
            s_data.pop();
        while(!s_signal.empty())
            s_signal.pop();
        s_signal.push('#');
        int result = 0;
        for(int i=0;i<str.length();i++){
            if(str[i]>='0' && str[i]<='9'){
                int num = 0;
                int j = i;
                while(str[j]>='0' && str[j]<='9'){
                    num = num * 10 + (str[j] - '0');
                    j++;
                }
                s_data.push(num);
                i = j - 1;
            }
            else{
                if(priority(str[i]) > priority(s_signal.top())){
                    s_signal.push(str[i]);
                }
                else{
                    do{
                        execution();

                    }while(priority(str[i]) <= priority(s_signal.top()));
                    s_signal.push(str[i]);
                }
            }
        }
        while(s_signal.top()!='#'){
            execution();
        }
        result = s_data.top();
        s_data.pop();
        return result;
}
int a[5];
string int2str(int n)
{
    if(n==0) return "0";
    string r;
    while(n)
    {
        r+=n%10+'0';
        n/=10;
    }
    reverse(r.begin(),r.end());
    return r;
}
void dfs(int d,string s)
{
    if(d==4)
    {
        if(solve(s)==24)
        {
            cnt++;
       // cout<<s<<endl;
        //cout<<solve(s)<<endl;
        }
        return ;
    }
    dfs(d+1,s+'+'+int2str(a[d]));
    dfs(d+1,s+'-'+int2str(a[d]));
    dfs(d+1,s+'*'+int2str(a[d]));
    if(a[d]) dfs(d+1,s+'/'+int2str(a[d]));
}
int main(){
    for(int i=0;i<4;i++) cin>>a[i];
    dfs(1,int2str(a[0]));
    cout<<cnt<<endl;
    return 0;
}
