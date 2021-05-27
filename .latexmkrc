@default_files = ('main.tex');

@cus_dep_list = (@cus_dep_list, "nlo nls 0 makenomenclature");
sub makenomenclature {
    system("makeindex -s nomencl.ist  -t $_[0].nlg -o $_[0].nls $_[0].nlo");
}
@generated_exts = (@generated_exts, 'nlo');

$clean_ext = "aux bbl nlg nlo nls";
