#include <iostream>
#include <Windows.h>

using namespace std;
int main()

{   
	cout << "Hola! Trataré de adivinar un número.";
	cout <<
	"Piensa un numero entre 1 y 10.";
	Sleep(5000);
	cout << "Ahora multiplícalo por 9.";
	Sleep(5000);
	cout << "Si el número tiene 2 dígitos, súmalos entre si: Ej. 36 -> 3+6=9. Si tu número tiene un solo dígito, súmale 0.";

	Sleep(5000);

	cout << "Al número resultante súmale 4.";

	Sleep(10000);

	cout << "Muy bien. El resultado es 13 :)";

	return 0;

}
