var documenterSearchIndex = {"docs":
[{"location":"references/","page":"References","title":"References","text":"CurrentModule = TuXartis","category":"page"},{"location":"references/#References","page":"References","title":"References","text":"","category":"section"},{"location":"demos/","page":"Demos","title":"Demos","text":"CurrentModule = TuXartis","category":"page"},{"location":"demos/#Demo-cases","page":"Demos","title":"Demo cases","text":"","category":"section"},{"location":"demos/#A-Barabasi-(random)-graph","page":"Demos","title":"A Barabasi (random) graph","text":"","category":"section"},{"location":"demos/","page":"Demos","title":"Demos","text":"(Image: )","category":"page"},{"location":"demos/","page":"Demos","title":"Demos","text":"Independent 2D vertex embedding and edge embedding in case (a) vs. the 2D twin-embeddings in case (b) of a Barabási-Albert graph (n = 500 nodes, m = 2,485 edges). For each case, in the vertex embedding (to the left), the same 9 vertex points with the highest degrees and the line segments representing their respective incident edges are highlighted in red. The highlighted line segments are translated to the corresponding edge points in the corresponding edge embedding space.","category":"page"},{"location":"demos/#Stick-sculpture","page":"Demos","title":"Stick sculpture","text":"","category":"section"},{"location":"demos/","page":"Demos","title":"Demos","text":"(Image: ) The sculpture is comprised of 105 sticks (edges) and 50 joins (vertices).  From left to right:  (a) A non-planar graph for the sculpture with n = 50 nodes and m = 105 edges; (b) The (m + n) × (m + n) twin-embedding adjacency matrix; see Equation (\\ref{xx}); (c) A 2D twin embedding of the graph.    (c-1) The vertex points marked in blue and the edge points in red are interspersed.    A blue vertex point has its adjacent vertex points in blue close by and its incident edges in red nearby. (c-2) The blue vertex points and the red edge points are well matched, manifesting the effect of self-assignment by the twin embedding.    (c-3) The red point clusters indicate densely bundled edges at high-degree vertices. (d) The vertex embedding is split from the twin embedding. Without external regulation, the line segments for the edges are well laid out and less prone to co-linear or overly crossing placements, as evidenced by the autonomous self-regulation induced by the twin-embedding method.","category":"page"},{"location":"demos/#The-subnetwork-of-vasculature-cells-from-the-Tabular-Sapiens-network","page":"Demos","title":"The subnetwork of vasculature cells from the Tabular Sapiens network","text":"","category":"section"},{"location":"demos/","page":"Demos","title":"Demos","text":"(Image: Test caption) ","category":"page"},{"location":"demos/","page":"Demos","title":"Demos","text":"Data source: Tabula Sapiens biological network data ","category":"page"},{"location":"demos/","page":"Demos","title":"Demos","text":"The subnetwork has n = 16037  nodes  for the cells and m = 158,885 edges by similarity in gene expressions. There  are 14 cell types or classes. ","category":"page"},{"location":"demos/","page":"Demos","title":"Demos","text":"(Left) The subnetwork G in a 2D vertex vector/point embedding space; \n(Middle) A 2D edge vector/point embedding space obtained by the twin-embedding method introduced in this paper; \n(Right) The right plot displays the twin-embedding matrix of (\\ref{??}). ","category":"page"},{"location":"demos/","page":"Demos","title":"Demos","text":"In the vertex embedding, the cell/vertex points are color-coded by the cell types.  In edge embedding, any point for an intra-class edge is colored by the same cell class color; any point for an inter-class edge is colored black. As the edge points are nearly 10 times denser, the edge-point marker size is made a quarter of the vertex-point marker size. The vertex point cloud and the edge point cloud are superbly aligned in their global configurations as well as in their class substructures.","category":"page"},{"location":"demos/#A-kNN-graph-of-MNIST-digit-image-collection","page":"Demos","title":"A kNN graph of MNIST-digit image collection","text":"","category":"section"},{"location":"demos/","page":"Demos","title":"Demos","text":"(Image: ) A kNN graph (k=16) for the image data MNIST-DIGITS in a 2D vertex embedding space. The dataset contains 70,000 images of handwritten digits. Every point in the embedding space represents a digit image, colored by its digit class cluster. Each cluster is textured by sampled digit images visible upon zoom-in. The clusters are spatially well separated. This advanced function is provided by tuXartis.","category":"page"},{"location":"demos/#the-email-network-at-the-University-of-xxx-at-the-year-of-xxx","page":"Demos","title":"the email network at the University of xxx at the year of xxx","text":"","category":"section"},{"location":"demos/","page":"Demos","title":"Demos","text":"(more to come)","category":"page"},{"location":"technical_description/","page":"Technical description","title":"Technical description","text":"CurrentModule = TuXartis","category":"page"},{"location":"technical_description/#Technical-description","page":"Technical description","title":"Technical description","text":"","category":"section"},{"location":"technical_description/","page":"Technical description","title":"Technical description","text":"Pages = [\"technical_description.md\"]\nDepth = 2:3","category":"page"},{"location":"technical_description/#Vertex/edge-indices","page":"Technical description","title":"Vertex/edge indices","text":"","category":"section"},{"location":"technical_description/#Vertex-indices","page":"Technical description","title":"Vertex indices","text":"","category":"section"},{"location":"technical_description/","page":"Technical description","title":"Technical description","text":"using Markdown\nMarkdown.parse_file(joinpath(\"..\", \"src\", \"vertex_indices.md\"))","category":"page"},{"location":"technical_description/#Edge-indices","page":"Technical description","title":"Edge indices","text":"","category":"section"},{"location":"technical_description/","page":"Technical description","title":"Technical description","text":"using Markdown\nMarkdown.parse_file(joinpath(\"..\", \"src\", \"edge_indices.md\"))","category":"page"},{"location":"technical_description/#Spatial-embedding","page":"Technical description","title":"Spatial embedding","text":"","category":"section"},{"location":"technical_description/","page":"Technical description","title":"Technical description","text":"using Markdown\nMarkdown.parse_file(joinpath(\"..\", \"src\", \"spatial_embedding.md\"))","category":"page"},{"location":"technical_description/#Histogram-images-on-spatial-maps","page":"Technical description","title":"Histogram images on spatial maps","text":"","category":"section"},{"location":"technical_description/","page":"Technical description","title":"Technical description","text":"using Markdown\nMarkdown.parse_file(joinpath(\"..\", \"src\", \"histogram_on_maps.md\"))","category":"page"},{"location":"technical_description/#Translation-of-histogram-images","page":"Technical description","title":"Translation of histogram images","text":"","category":"section"},{"location":"technical_description/","page":"Technical description","title":"Technical description","text":"using Markdown\nMarkdown.parse_file(joinpath(\"..\", \"src\", \"histogram_translation.md\"))","category":"page"},{"location":"histogram_on_maps/","page":"-","title":"-","text":"(must demo an image of a bin on a map, one for vertices, one for edges) ","category":"page"},{"location":"histogram_translation/","page":"-","title":"-","text":"o between two vertex maps   o between two edge maps   o between a vertex map and an edge map ","category":"page"},{"location":"histogram_translation/","page":"-","title":"-","text":"( must demo the image translation  ) ","category":"page"},{"location":"api/","page":"User interface","title":"User interface","text":"CurrentModule = TuXartis","category":"page"},{"location":"api/#User-interface","page":"User interface","title":"User interface","text":"","category":"section"},{"location":"api/","page":"User interface","title":"User interface","text":"o interface channel ","category":"page"},{"location":"api/","page":"User interface","title":"User interface","text":"via data \nvia function handles","category":"page"},{"location":"api/","page":"User interface","title":"User interface","text":"o interface functionalities   ","category":"page"},{"location":"api/","page":"User interface","title":"User interface","text":"select or link to a different embedding method \nselect or use a vertex or edge index \nspecify a particular transform of a vertex/edge variable \nspecify a particular subset of vertices or edges ","category":"page"},{"location":"api/#API","page":"User interface","title":"API","text":"","category":"section"},{"location":"api/","page":"User interface","title":"User interface","text":"","category":"page"},{"location":"api/","page":"User interface","title":"User interface","text":"Modules = [TuXartis]","category":"page"},{"location":"vertex_indices/","page":"-","title":"-","text":"degree\nlocal cluster coefficient\ndegree centrality\nneighbor degree centrality\nneighbor embeddedness centrality \nhits\n(Perron) eigenvectoror centrality ","category":"page"},{"location":"spatial_embedding/","page":"-","title":"-","text":"(low-dimensional real-valued vector representation) ","category":"page"},{"location":"spatial_embedding/","page":"-","title":"-","text":"Embedding types\nvertex embedding/vector representation\nedge embedding\ninduced by vertex embedding\ngenerated via line graph\nvertex-edge twin-embedding ( a unification and a generalization ) \nEmbedding properties (basic) \nadjacent vertices are closer to each other in the real-valued vector space\nincident edges are closer to each other in he real-valued vector space \nEmbedding methods\nby force\nvia graph Laplacian\nby SG-t-SNE\n(add more)\n","category":"page"},{"location":"feedback/","page":"Feedback","title":"Feedback","text":"CurrentModule = TuXartis","category":"page"},{"location":"feedback/#Feedback","page":"Feedback","title":"Feedback","text":"","category":"section"},{"location":"related_software/","page":"Related software packages","title":"Related software packages","text":"CurrentModule = TuXartis","category":"page"},{"location":"related_software/#Related-software-packages","page":"Related software packages","title":"Related software packages","text":"","category":"section"},{"location":"edge_indices/","page":"-","title":"-","text":"degree \ncommon neighbors (number of incident triangles)\nAdamic-Adar\nRicci curvature \nsublist\nanother item","category":"page"},{"location":"mathematical_description/","page":"Mathematical description","title":"Mathematical description","text":"CurrentModule = TuXartis","category":"page"},{"location":"mathematical_description/#Mathematical-description","page":"Mathematical description","title":"Mathematical description","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = TuXartis","category":"page"},{"location":"#TuXartis","page":"Home","title":"TuXartis","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"A package for visualizing vertex and edge properties on graphs or networks.","category":"page"},{"location":"#Table-of-contents","page":"Home","title":"Table of contents","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Pages = map( x->x[2], Main.ALLPAGES )\nDepth = 4","category":"page"},{"location":"#Brief-description","page":"Home","title":"Brief description","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"(with active links to relevant sections, subsections, equations, references) ","category":"page"},{"location":"#Software-architecture","page":"Home","title":"Software architecture","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"(with active links) ","category":"page"},{"location":"#Julia-and-beyond","page":"Home","title":"Julia and beyond","text":"","category":"section"}]
}
