#include <iostream>
#include <stack>
using namespace std;

stack <int>s_data;
stack <char>s_signal;

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
           if(tempB)
            temp = tempA / tempB;
       }
    else if(operation == '+')
        temp = tempA + tempB;
    else if(operation == '-')
        temp = tempA - tempB;
    s_data.push(temp);
}
void solve(string str)
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
        cout<<result<<endl;
}
int main(){
    string str;
    while(cin>>str){
       solve(str);
    }
    return 0;
}
