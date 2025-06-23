source(findFile('scripts', 'antares-squish-globals/ivi-pom/object_references.py'))
source(findFile('scripts', 'antares-squish-globals/ivi-pom/actions_general.py'))
source(findFile('scripts', 'antares-squish-globals/ivi-pom/actions_media.py'))


class Ivi( IVI_General_Actions, IVI_Media_Actions ):
    
    objects = Ivi_Objects()

