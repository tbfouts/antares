source(findFile('scripts', 'antares-squish-globals/cluster-pom/object_references.py'))
source(findFile('scripts', 'antares-squish-globals/cluster-pom/actions.py'))


class Cluster( Cluster_Actions ):
    
    objects = Cluster_Objects()
    pass
    