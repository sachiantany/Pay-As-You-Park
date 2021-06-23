#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
pd.set_option('display.max_columns', 500)

import numpy as np

import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')

import matplotlib.ticker as ticker


# In[2]:


def sample_plots_by_scn(df, num_graphs, num_per_row, fig_width=16, hspace=0.6):
    """Print a sample of the data by Parking location, identified with the field SystemCodeNumber
    Parameters:
    num_graphs: Number of locations to make graphs for, ordered by appearance in the dataset.
    
    num_per_row: Number of columns in subplot.
    
    fig_width: Used to adjust the width of the subplots figure.  (default=16)
    
    hspace: Used to adjust whitespace between each row of subplots. (default=0.6)"""
    num_rows = int(np.ceil(num_graphs/num_per_row))
    fig, axes = plt.subplots(nrows=num_rows, ncols=num_per_row, figsize=(fig_width, num_rows * fig_width/4))
    fig.subplots_adjust(hspace=hspace)
    plt.xticks(rotation=45)
    for i, scn in enumerate(df.parking_yard_id.unique()[:num_graphs]):
        temp_df = df[df.parking_yard_id==scn]
        ax = axes[i//num_per_row, i%num_per_row]
        ax.plot(temp_df.last_update, temp_df.PercentOccupied)
        ax.set_title('Parking Area: {}'.format(scn))
        ax.set_xlabel('Date')
        ax.set_ylabel('Percent Occupied')
        ax.yaxis.set_major_formatter(ticker.PercentFormatter(xmax=1));
        
    for ax in fig.axes:
        plt.sca(ax)
        plt.xticks(rotation=45)


# In[ ]:




