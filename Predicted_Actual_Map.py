#!/usr/bin/env python
# coding: utf-8

# In[1]:


pip install chart-studio


# In[57]:


from plotly.offline import init_notebook_mode, iplot
from IPython.display import display, HTML
import numpy as np
from PIL import Image

image = Image.open("D:/4th-Year/Research Proposal/Beacon_Layout.jpg")
init_notebook_mode(connected=True)
 
t_test_x = 20 #Actual Values
t_test_y = 15
 
xm=np.min(t_test_x)-1.5
xM=np.max(t_test_x)+1.5
ym=np.min(t_test_y)-1.5
yM=np.max(t_test_y)+1.5

data=[dict(x=[0], y=[0], 
           mode="markers", name = "Predictions",
           line=dict(width=2, color='green')
          ),
      dict(x=[0], y=[0], 
           mode="markers", name = "Actual",
           line=dict(width=2, color='blue')
          )
      
    ]

layout=dict(xaxis=dict(range=[xm, 60], autorange=False, zeroline=False),
            yaxis=dict(range=[ym, 50], autorange=False, zeroline=False),
            title='Predictions for SVC', hovermode='closest',
            images= [dict(
                  source= image,
                  xref= "x",
                  yref= "y",
                  x= 0,
                  y= 50,
                  sizex= 60,
                  sizey=100,
                  sizing= "stretch",
                  opacity= 0.5,
                  layer= "below")]
            )

frames=[dict(data=[dict(x=[25], #predicted values
                        y=[16], 
                        mode='markers',
                        
                        marker=dict(color='red', size=10)
                        ),
                   dict(x=[t_test_x], 
                        y=[t_test_y], 
                        mode='markers',
                        
                        marker=dict(color='blue', size=10)
                        )
                  ]) for k in range(int(t_test_x)) 
       ]    
          
figure1=dict(data=data, layout=layout, frames=frames)          
iplot(figure1)


# In[ ]:




