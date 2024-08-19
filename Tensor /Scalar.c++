#include <iostream>
using namespace std;
class Scalar
{

private:
    float value;

public:
    Scalar(float temp)
    {
        this->value = temp;
    }
    void print()
    {
        cout << "type=scalar value=" << this->value << endl;
    }
    void operator-()
    {
        this->value = this->value * (-1);
    }
    void operator+(Scalar &s)
    {
        this->value = this->value + s.value;
    }
    void operator-(Scalar &s)
    {
        this->value = this->value - s.value;
    }
    void operator*(Scalar &s)
    {
        this->value = this->value * s.value;
    }
    void operator/(Scalar &s)
    {
        try
        {
            this->value = this->value / s.value;
        }
        catch (const std::exception &e)
        {
            std::cerr << e.what() << "May be division by 0" << '\n';
        }
    }
};

int main(){
    return 0; 
}