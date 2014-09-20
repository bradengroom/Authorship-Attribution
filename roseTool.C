#include "rose.h"

class ToolVisitor : public AstSimpleProcessing {

	void atTraversalStart() {
		//Any preliminary work that needs to be done can go here.
		printf("Traversal starts here\n");
	}

	void atTraversalEnd(){
		//Any work that needs to be done after the traversal can go here.
		printf("Traversal ends here\n");
	}

	void visit (SgNode* node) {
		//This is the visitor function. The ToolVisitor obeys the visitor design pattern.
		if ( isSgForStatement(node) != NULL) {
			printf("Found a for loop...\n");
		}
		printf("%s\n", node->sage_class_name());
	}
};

int main (int argc, char* argv[]) {

	SgProject* project = frontend(argc, argv);

	ROSE_ASSERT(project != NULL);

	ToolVisitor traversal;

	traversal.traverseInputFiles(project, preorder);

	return backend(project);
}

