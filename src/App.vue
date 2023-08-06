<script setup>
import HighlightText from './components/HighLightText.vue'
import { XCircleIcon, ChatBubbleLeftIcon } from '@heroicons/vue/24/solid'
import { ref } from 'vue'

let allMessages = ref([
    'developerky tugezer strong',
    'passport secoority first',
    'documenten controllen',
])
let message = ''
let filter = ref('')

function getAllMessages() {
    let filteredMessages = []
    for (let msg of allMessages.value) {
        if (msg.includes(filter.value)) filteredMessages.push(msg)
    }
    // return allMessages.value.filter((msg) => {
    //     return msg.includes(filter.value)
    // })
    return filteredMessages
}

function addMessage() {
    // TODO: do not add empty message
    allMessages.value.unshift(message)
}

function deleteMessage(index) {
    allMessages.value.splice(index, 1)
}
</script>

<template>
    <div class="container">
        <div class="input">
            <input placeholder="Type your message" v-model="message" />
            <button @click="addMessage()">Send</button>
        </div>
        <div class="search">
            <p>Your messages</p>
            <input placeholder="Search" v-model="filter" />
        </div>
        <div
            class="list-of-messages"
            v-for="(item, index) in getAllMessages()"
            :key="index"
        >
            <div class="message">
                <div class="message-wrap">
                    <div class="message-text">
                        <HighlightText :prop_text="item" :prop_match="filter" />
                    </div>
                </div>
                <div class="message-delete-button">
                    <button @click="deleteMessage(index)" class="delete-button">
                        <component :is="XCircleIcon" class="icon" />
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.message-wrap {
    flex-grow: 1;
    display: flex;
}
.message {
    display: flex;
    justify-content: space-between;
    text-align: left;
    background-color: rgb(14, 89, 110);
    margin-bottom: 0.5rem;
    padding: 0.5rem;
    padding-left: 1rem;
    color: #fcf8f8e6;
    border-radius: 15px;
}

.message-text {
    overflow-wrap: break-word;
    width: 100%;
}

.icon {
    width: 1.5rem;
    height: 1.5rem;
    color: #fcf8f8e6;
}

.delete-button {
    border: none;
    margin: 0;
    padding: 0;
    background-color: rgb(14, 89, 110);
    border-top-right-radius: 15px;
    border-bottom-right-radius: 15px;
    cursor: pointer;
    text-align: center;
    display: flex;
}

.container {
    width: 30rem;
}

.input {
    display: flex;
    justify-content: left;
}

.input input {
    flex-grow: 1;
    border-right: none;
    border: 1px solid rgb(14, 89, 110);
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    padding: 0.2rem 0.5rem;
}

.input input:focus {
    outline: none;
    border: 1px solid rgb(14, 89, 110);
}

.input button {
    border: 1px solid rgb(14, 89, 110);
    background-color: rgb(14, 89, 110);
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    padding: 0.5rem;
    color: aliceblue;
    cursor: pointer;
    font-size: 1rem;
}

.search {
    display: flex;
    justify-content: left;
    gap: 2rem;
    border-top: 1px solid grey;
    border-bottom: 1px solid grey;
    margin-top: 0.5rem;
    padding-top: 2.5rem;
    margin-bottom: 0.5rem;
    padding-bottom: 0.5rem;
}

.search input {
    flex-grow: 1;
    border-radius: 15px;
    padding: 0.2rem;
    border: 1px solid rgb(95, 106, 109);
    text-align: center;
}

.search p {
    margin: 0;
    padding: 0;
}
</style>
