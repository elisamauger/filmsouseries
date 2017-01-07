var checker = {
    elements: [
    	document.getElementById('films-index'),
    	document.getElementById('series-index'),
    	document.getElementById('films-index'),
    ],
    url: {
    	films: function(id, checked) {
       		return '/films/'+id+'/set_checked/'+(checked ? 'true' : 'false')+'.json';
       	},
       	series: function(id, checked) {
       		return '/series/'+id+'/set_checked/'+(checked ? 'true' : 'false')+'.json';
       	},
       	documentaires: function(id, checked) {
       		return '/documentaires/'+id+'/set_checked/'+(checked ? 'true' : 'false')+'.json';
       	},
    },
    onchange: function(event) {
            films.update(this, this.getAttribute('data-id'), this.checked);
    },
    update: function(type) {
    	return function(checkbox, id, checked) {
	        var xhr = new XMLHttpRequest;
	        xhr.open('GET', this.url[type](id, checked), true);

	        xhr.onreadystatechange = function(event) {
	            if(xhr.readyState == 4) {
	                if(xhr.status == 200) {
	                    var response = JSON.parse(xhr.responseText);
	                    if(response.status) {
	                        if(response.checked) checkbox.setAttribute('checked', true);
	                        else checkbox.removeAttribute('checked');
	                    }
	                }
	            }
	        };

	        xhr.send();
	    };
    },
    init: function() {
    	for(var i= 0; i < this.elements.length; i++) {
    		var element = this.elements[i];
    		if(element) {
    			type = element.id.replace(/-index$/, '');
	            var checkboxes = element.querySelectorAll('input[type="checkbox"]');
	            for(var i = 0; i < checkboxes.length; i++) {
	                checkboxes[i].addEventListener('change', this.onchange(type));
	            }
	        }
    	}
    }      
};

checker.init();