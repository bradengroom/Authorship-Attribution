#include "rose.h"

class Accumulator
{
	public:
		int forLoops, functions, variables, assignments;
		Accumulator ()
		{
			forLoops = 0;
			functions = 0;
			variables = 0;
			assignments = 0;
		}

		Accumulator (const Accumulator & X) {}

		Accumulator & operator = (const Accumulator & X)
		{
			return *this;
		}

};

class visitorTraversal : public AstSimpleProcessing
{
	public:
		static Accumulator accumulator;
		virtual void visit(SgNode* n);
};

Accumulator visitorTraversal::accumulator;

void visitorTraversal::visit(SgNode* n)
{

	const SgInitializedName* sym  = isSgInitializedName(n);

	if (isSgForStatement(n) != NULL)
	{
		accumulator.forLoops++;
	}
	else if (isSgFunctionDefinition(n) != NULL)
	{
		accumulator.functions++;
	}
	else if (isSgVariableDeclaration(n) != NULL)
	{
		accumulator.variables++;
	}
        else if (isSgAssignOp(n) != NULL)
        {
                accumulator.assignments++;
        }
	else if (sym != NULL)
	{
		printf("%s\n",sym->get_name().getString().c_str());
	}
	else if (isSgName(n) != NULL)
	{
		printf("Found name\n");
	}

	//printf("%s\n", n->class_name().c_str());

	

}

int main (int argc, char* argv[]) {

	SgProject* project = frontend(argc, argv);

	ROSE_ASSERT(project != NULL);

	visitorTraversal exampleTraversal;

	exampleTraversal.traverseInputFiles(project, preorder);

	printf("Number of for loops in input application = %d\n", exampleTraversal.accumulator.forLoops);
	printf("Number of functions in input application = %d\n", exampleTraversal.accumulator.functions);
	printf("Number of variables in input application = %d\n", exampleTraversal.accumulator.variables);
        printf("Number of assignments in input application = %d\n", exampleTraversal.accumulator.assignments);

	return backend(project);
}

