```@meta
CurrentModule = TuXartis
```

# Mathematical description 

## Notations 
+ $G(V,E)$ graph with vertex set $V$ and edge set $E$, $E \subset V\times V$ 
+ $\mathcal{N}(x)$ is the neighborhood of $v$, i.e., the set of nodes adjacent to vertex $x$, not including $x$
+ $|S|$ is the cardnal of set $S$
+ $A$ the adjacency matrix of $G(V,E)$

+ 
## Vertex degree 
$$k(v) = | \mathcal{N}(v) |, \quad \forall v \in V $$ 

## Local cluster coefficient 

$$ \textrm{lcc}(v) = \sum_{ (v,u) \in E}
                   \frac{ \mbox{\rm cn}(v,u) }{ k(x)(k(x)-1)} 
                   = \frac{| \mathcal{N}(u) \cap \mathcal{N}(v)|}{ k(x)(k(x)-1)}  
$$

see \cite{Watss-xxx}

## (Perron) eigenvector centrality 

$$ \textrm{eig-c}(v) = \textrm{to fill-in}
$$ 

see \cite{newman-girvan-2004} 

## hits 
$$\textrm{hits}(v) = 
$$ 
see \cite{Kleinberg-1999} 

## Edge degree 
$$k( \ell ) = k(u) + k(v) -2, \quad  \ell = (u,v) \in E$$ 

## Common neighbors 
$$\textrm{cn}(\ell) = | \mathcal{N}(u) \cap \mathcal{N}(v)|, 
   \quad \ell = (u,v) \in E 
   $$ 

It is equal to the number of triangles containing edge $\ell$ 

See \cite{newman-girvan-2004} 

## Adamic-Adar index 

```math
\textrm{aa}(x,y) = \sum_{u \in \mathcal{N}(x) \cap \mathcal{N}(y) }  \frac{1}{ \log( k(u) ) } 
```
see \cite{adamic-adar-2023} 

## Ricci curvature 

