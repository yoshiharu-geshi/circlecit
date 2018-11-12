/**
 * @fileoverview Source code for no http rule
 * @author Lai
 */

'use strict';

//------------------------------------------------------------------------------
// Constants
//------------------------------------------------------------------------------
module.exports = {
    meta: {
        docs: {
            description: 'enforce a url protocol',
            category: 'Protocol Issues',
            recommended: true
        },

        fixable: 'string',

        schema: [
            {
                type: 'object',
                properties: {
                    blackList: {
                        type: 'array',
                        items: {
                            type: 'string'
                        }
                    },
                    whiteList: {
                        type: 'array',
                        items: {
                            type: 'string'
                        }
                    }
                }
            }
        ]
    },

    create(context) {
        const options = context.options[0] || [];

        const blackList = options.blackList || [];
        const blackListRex = new RegExp('http:\/\/.*(' + blackList.join('|') + ')');

        const whiteList = options.whiteList || [];
        const whitListRex = new RegExp('(' + whiteList.join('|') + ')');

        /**
         * httpが入ったらエラーが出る
         * @param {ASTNode} node - A comment node to check.
         * @returns {void}
         */
        function checkHttp(node) {
            if (node.value.search(blackListRex) !== -1) {
                if (whiteList.length == 0 || node.value.search(whitListRex) === -1) {
                    context.report({
                        node,
                        message: 'Cannot use protocol "http" when domain include "{{domain}}": {{url}}',
                        data: {
                            domain: blackListRex.exec(node.value)[1],
                            url: node.value,
                        }
                    });
                }
            }
        }

        return {
            Program() {
                const sourceCode = context.getSourceCode();

                sourceCode.ast.tokens.filter(token => token.type === 'String').forEach(checkHttp);
            }
        };
    }
};
