'use strict';
/* Filters */
app.filter("flatten", function(){
    return function(input){
        var flattened = [];
        for(var x = 0; x < input.length; x++){
        	if(!!input[x].contents){
        		input[x].flattened = true;
        		flattened.push(input[x]);
        		input[x].contents.sort(function(a,b){return a.rank - b.rank});
        		for(var y in input[x].contents){
        			input[x].contents[y].margin = true;
        			flattened.push(input[x].contents[y])
        		}
        	}else{
        		flattened.push(input[x])
        	}
        }
        return flattened;
    }
});
