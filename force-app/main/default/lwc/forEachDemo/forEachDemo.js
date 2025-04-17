import { LightningElement } from 'lwc';

export default class ForEachDemo extends LightningElement {
    contacts = [
        { Id: 1,
            Name: 'Sathya',
            Title: 'Team Lead'
        },
        { Id: 2,
            Name: 'Prateek',
            Title: 'Junior Dev'
        },
        { Id: 3,
            Name: 'Satish',
            Title: 'Sathya\'s Bestfriend'
        }
    ]
}