#from pprint import pprint as pp
import logging
import shutil
from functools import partial
from pathlib import Path
from typing import Any

import mako
import mako.lookup
import yaml
from dotwiz import DotWiz


log = logging.getLogger(__name__)


# https://stackoverflow.com/a/74728773/3356840
def yaml_include_constructor(loader: yaml.Loader, node: yaml.Node) -> Any:
    """Include YAML file referenced with `!include filename`"""
    with open(Path(loader.name).parent.joinpath(loader.construct_yaml_str(node)).resolve(), "r") as f:
        return yaml.load(f, type(loader))
YamlLoader = yaml.SafeLoader  # Works with any loader
YamlLoader.add_constructor("!include", yaml_include_constructor)
yaml_load = partial(yaml.load, Loader=YamlLoader)


PATH_BUILD = Path('./build')
PATH_BUILD.mkdir(exist_ok=True)


PATH_STATIC = (
    Path('./static'),
    Path('./images'),
)

PATH_TEMPLATES = Path('./templates')
template_lookup = mako.lookup.TemplateLookup(directories=(PATH_TEMPLATES,))
def render_template(path: Path, context) -> str:
    try:
        return template_lookup.get_template(str(path.relative_to(PATH_TEMPLATES))).render(**context)
    except Exception:
        print(mako.exceptions.text_error_template().render())  # TODO stderr?
        return ''


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)

    context = DotWiz(yaml_load(Path('data/index.yaml').open()))
    #pp(data)

    for path in PATH_TEMPLATES.iterdir():
        if path.suffix != '.mako' or path.stem.startswith('_'):
            continue

        rendered = render_template(path, context)
        if not rendered:
            log.error(f'Failed to render template {path}')
            continue

        path_output = PATH_BUILD.joinpath(path.stem)
        path_output.write_text(rendered)
        log.info(path_output)

    for path in PATH_STATIC:
        shutil.copytree(path, PATH_BUILD.joinpath(path), dirs_exist_ok=True)
