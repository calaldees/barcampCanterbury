#from pprint import pprint as pp
import sys
import logging
from functools import partial
from pathlib import Path
from typing import Any

import yaml
import mako
import mako.lookup
#from mako import exceptions as mako_exceptions
#from mako.lookup import TemplateLookup
#from mako.template import Template

log = logging.getLogger(__name__)


# https://stackoverflow.com/a/74728773/3356840
def yaml_include_constructor(loader: yaml.Loader, node: yaml.Node) -> Any:
    """Include YAML file referenced with !include node"""
    with open(Path(loader.name).parent.joinpath(loader.construct_yaml_str(node)).resolve(), "r") as f:
        return yaml.load(f, type(loader))
YamlLoader = yaml.SafeLoader  # Works with any loader
YamlLoader.add_constructor("!include", yaml_include_constructor)
yaml_load = partial(yaml.load, Loader=YamlLoader)


PATH_BUILD = Path('./build')
PATH_TEMPLATES = Path('./templates')

PATH_BUILD.mkdir(exist_ok=True)
template_lookup = mako.lookup.TemplateLookup(directories=(
    PATH_TEMPLATES,
))


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    data = yaml_load(Path('data/index.yaml').open())
    #pp(data)
    for path in PATH_TEMPLATES.iterdir():
        if path.suffix != '.mako' or path.stem.startswith('_'):
            continue

        try:
            rendered = template_lookup.get_template(str(path.relative_to(PATH_TEMPLATES))).render(**data)
        except Exception:
            print(mako.exceptions.text_error_template().render())
            sys.exit(1)
        path_output = PATH_BUILD.joinpath(path.stem)
        path_output.write_text(rendered)
        log.info(path_output)
