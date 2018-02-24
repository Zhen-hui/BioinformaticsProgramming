#!/bin/perl
use strict;
use warnings;

use Bio::OntologyIO;
# Instantiate Bio::OntologyIO and assign the #parser variable
my $parser = Bio::OntologyIO->new(
	-format => "obo",
	-file   => "go-basic.obo"
);
# Loop through the ontology with next_ontology
while (my $ont = $parser->next_ontology()){
	#print "read ontology ", $ont->name(), " with ",
	#  scalar($ont->get_root_terms)," root terms, and ",
	#  scalar($ont->get_leaf_terms)," leaf terms\n";
	if ($ont->name() eq "biological_process"){
		foreach my $leaf ($ont->get_leaf_terms){
			my $go_name = $leaf->name();
			my $go_id   = $leaf->identifier();
			print join("\t",$go_id,$go_name),"\n";
		}
	}
	
}