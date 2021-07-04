///scr_getWord();
//Returns a random word from a list of words for use in a stream game!

word_list = ds_list_create();
ds_list_add(word_list,"Tomato");
ds_list_add(word_list,"Gremlin");
ds_list_add(word_list,"Onion");
ds_list_add(word_list,"Momentum");
ds_list_add(word_list,"Equivocal");
ds_list_add(word_list,"Freudian");
ds_list_add(word_list,"Township");
ds_list_add(word_list,"Video Game");
ds_list_add(word_list,"Demonstratively");

word_list_size = ds_list_size(word_list);
return ds_list_find_value(word_list,irandom(word_list_size-1));

ds_list_destroy(word_list);
