
#include <iostream>
#include <string>
#include <sdk/model/Object.hpp>

#include "Generated/ScriptObject.hpp"

using namespace std;

int main(int argc, const char* argv[]) {

    Object obj = Object(5);
    ScriptObject s_obj = ScriptObject(10);

    cout << "Hello world!"<< endl;
    cout << "Object x: " + to_string(obj.getX()) << endl;
    cout << "ScriptObject x: " + to_string(s_obj.getX()) << endl;
    return 0;
}
