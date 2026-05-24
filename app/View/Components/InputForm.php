<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class InputForm extends Component
{
    public string $name;
    public ?string $label;
    public string $type;
    public mixed $value;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct(string $name, $label = null, $type = 'text', $value = '')
    {
        $this->name = $name;
        $this->label = $label;
        $this->type = $type;
        $this->value = $value;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return View|Closure|string
     */
    public function render(): View|string|Closure
    {
        return view('components.input-form');
    }
}
