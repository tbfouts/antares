
def get_nested_attr(obj, attr_path):
    """ Recursively get the value of nested attributes. """
    attrs = attr_path.split('.')
    for attr in attrs:
        obj = getattr(obj, attr, None)
        if obj is None:
            return None
    return obj

def match_properties(obj, properties, parent_key=''):
    """ Recursively match properties, supporting nested dictionaries. """
    for key, value in properties.items():
        current_key = f"{parent_key}.{key}" if parent_key else key
        if isinstance(value, dict):
            if not match_properties(obj, value, current_key):
                return False
        else:
            if get_nested_attr(obj, current_key) != value:
                return False
    return True

def find_recursively(parent, properties: dict, max_search_depth: int = 999, find_all_matches=False, current_depth: int = 0):
    """
    Recursively searches (DFS) within a parent object for a child object that has the {property:value} 
    Returns a Squish object reference if a match is found, otherwise `None` 
    
    Options:
        `parent`: The parent object to search within, must be a Squish object reference, e.g. waitForObject(names.window)
        `properties': A dictionary of property/value combinations. Can be as few as a single property (like `id` or
                      `objectName`), many properties, or even nested properties
        `max_search_depth`: In order to make the DFS search faster, you can limit the search depth if you know
                            the object hierarchy (from using the spy tool)
        `find_all_matches`: If set to True, will return all child objects that have the matching input properties. 
                            If left as False, will return the first matching object found.
                            
    Usage
        find_recursively(waitForObject(names.window), {"name": "warningBtn", "color": {"red": 255}}, 3)
        
    """
    if current_depth > max_search_depth:
        return []

    matching_children = []

    # DFS search pattern
    for child in object.children(parent):
        try:
            match_found = match_properties(child, properties)
        except AttributeError:
            # test object did not have requested property
            match_found = False
            # pass

        if match_found:
            if find_all_matches:
                matching_children.append(child)
            else:
                return child

        result = find_recursively(child, properties, max_search_depth, find_all_matches, current_depth=current_depth + 1)

        if result == None:
            continue
        if isinstance(result, list) and (len(result) < 1):
            continue

        if not find_all_matches:
            return result  # Return the first found matching object if find_all_matches is disabled
        matching_children += result

    return matching_children if find_all_matches and matching_children else None
        