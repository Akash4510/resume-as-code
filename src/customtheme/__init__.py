from typing import Literal
from rendercv.themes.classic import ClassicThemeOptions

# Inheriting from ClassicThemeOptions tells the compiler to accept all your design settings!
class CustomthemeThemeOptions(ClassicThemeOptions):
    theme: Literal["customtheme"] = "customtheme"
