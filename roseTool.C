#include "rose.h"
#include "wholeAST.h"
#include <iostream>
#include <cstdlib>
namespace SI = SageInterface;
namespace SB = SageBuilder;


void toolRoutine(SgNode* node){
	class ToolVisitor : public AstSimpleProcessing {
	
		void atTraversalStart() {
			//Any preliminary work that needs to be done can go here.
			printf("Node start\n");
		}
		
		void atTraversalEnd(){
			//Any work that needs to be done after the traversal can go here.
			printf("Node end\n");
		}
		
		void visit (SgNode* node) {
			//This is the visitor function. The ToolVisitor obeys the visitor design pattern.

			SgLocatedNode* locatedNode = isSgLocatedNode(node);

			if (locatedNode != NULL)
			{
				AttachedPreprocessingInfoType* comments = locatedNode->getAttachedPreprocessingInfo();

				if (comments != NULL)
				{
					AttachedPreprocessingInfoType::iterator i;
					for (i = comments->begin(); i != comments->end(); i++)
					{
						if (strcmp(PreprocessingInfo::directiveTypeName((*i)->getTypeOfDirective()).c_str(), "CpreprocessorIncludeDeclaration") != 0)
						{
							printf("COMMENT:\n%s\n\n", (*i)->getString().c_str());
							(*i)->setString("//Changed comment");
						}
					}
				}
			}
		}
	
	};

	ROSE_ASSERT(node != NULL);
	ToolVisitor visitor;
	visitor.traverse(node,preorder);
	
}


int main(int argc, char* argv[]) {

	SgProject* project = frontend(argc, argv);
	ROSE_ASSERT(project != NULL);

	toolRoutine(project);
	project->unparse();

	return 0;


}

