function pop_dec1=translate_DNA(pop,len,DNA_SIZE)
    pop_char=int2str(pop);
    pop_dec=bin2dec(pop_char);
    pop_dec1=(pop_dec/(power(2,DNA_SIZE)-1))*len;
end