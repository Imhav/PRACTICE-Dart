# W4 - S2 - Statefull widget - TODO BEFORE
## Name: Venhav Ou
### Group: 2
### ID: ITDB090144
### Lect: Ronan Ogor
---
### Why do we have a distinction between  stateless and statefull widgets?

### EXPLAIN:
<p>&emsp;&emsp;A widget is either stateful or stateless. If a widget can change—when a user interacts with it, for example—it's stateful. </p>
<p>-&ensp;A stateless widget never changes.<font color="cyan">Icon, IconButton</font>, and <font color="cyan">Text</font> are examples of stateless widgets. Stateless widgets subclass <font color="cyan">StatelessWidget</font>.
</p>
<p>-&ensp;A stateful widget is dynamic: for example, it can change its appearance in response to events triggered by user interactions or when it receives data. <font color="cyan">Checkbox, Radio, Slider, InkWell, Form,</font> and <font color="cyan">TextField</font> are examples of stateful widgets. Stateful widgets subclass <font color="cyan">StatefulWidget.</font>
</p>

---
### When do I need use a stateless widget?
### EXPLAIN : 
<p>&emsp;&emsp;Stateless widget are useful when the part of the user interface you are describing does not depend on anything other than the configuration information in the object itself and the BuildContext in which the widget is inflated.
</p>

---
### When do I need use a stateful widget?
### EXPLAIN :
<p>&emsp;&emsp;Stateful widgets are useful when the part of the user interface you are describing can change dynamically, e.g. due to having an internal clock-driven state, or depending on some system state.
</p>










