library(SpiecEasi)

#p_value <- 0.01;
#libs <- c("Hmisc");
#lapply(libs, require, character.only=T);

input <- function(inputfile) {
  pc <<- read.csv(inputfile, header = TRUE);
}


run <- function() {
  cn <<- colnames(pc);
  cn <<- cn[2:length(cn)];
  pc <<- pc[,-1];
  depths <- rowSums(pc);
  filtN <- t(apply(pc, 1, norm_to_total));
  filtCS <- round(filtN * min(depths));
  d <- ncol(filtCS);
  n <- nrow(filtCS);
  e <- d;
  set.seed(10010);
  graph <- make_graph('cluster', d, e);
  print(d);
  print(e);
  Prec <- graph2prec(graph);
  Cor <<- cov2cor(prec2cov(Prec));
  X <<- synth_comm_from_counts(filtCS, mar=2, distr='zinegbin', Sigma=Cor, n=n); 
}

output <- function(outputfile) {
   write.table(Cor, file=paste(outputfile, ".synthetic.correlations.csv", sep="", collapse = NULL), sep=",", append=FALSE, row.names=unlist(cn), col.names=unlist(cn), na="");
   write.table(X, file=paste(outputfile, ".synthetic.csv", sep="", collapse = NULL), sep=",", append=FALSE, row.names=unlist(rownames(pc)), col.names=unlist(cn), na="");
}


