#include "rose.h"

class AccumulatorAttribute
{
	public:
		int forLoopCounter;
		AccumulatorAttribute ()
		{
			forLoopCounter = 0;
		}

		AccumulatorAttribute (const AccumulatorAttribute & X) {}

		AccumulatorAttribute & operator = (const AccumulatorAttribute & X)
		{
			return * this;
		}

};

class visitorTraversal : public AstSimpleProcessing
{
	public:
		static AccumulatorAttribute accumulatorAttribute;
		virtual void visit(SgNode* n);
};

AccumulatorAttribute visitorTraversal::accumulatorAttribute;

void visitorTraversal::visit(SgNode* n)
{

	if(isSgForStatement(n) != NULL)
	{
		printf("Found a for loop...\n");
		accumulatorAttribute.forLoopCounter++;
	}
}

int main (int argc, char* argv[]) {

	SgProject* project = frontend(argc, argv);

	ROSE_ASSERT(project != NULL);

	visitorTraversal exampleTraversal;

	exampleTraversal.traverseInputFiles(project, preorder);

	printf("Number of for loops in input application = %d\n", exampleTraversal.accumulatorAttribute.forLoopCounter);

	return backend(project);
}

