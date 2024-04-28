<template>
    <v-container fluid>
        <v-layout>
            <v-flex>
                <v-layout column class="ma-3">
                    <h1 class="headline">Novo Endereco</h1>
                    <v-divider class="mb-3" />
                        <div v-if="erros">
                            <Erros :erros="erros" />
                        </div>
                        <v-text-field label="Logradoruro"
                            v-model="endereco.logradoruro" />
                        <v-text-field label="CEP"
                            v-model="endereco.CEP" />
                        <v-text-field label="Bairro"
                            v-model="endereco.bairro" />
                        <v-text-field label="Cidade"
                            v-model="endereco.cidade" />
                        <v-text-field label="Estado"
                            v-model="endereco.estado" />
                        <v-text-field label="País"
                            v-model="endereco.pais" />
                        <v-btn color="primary" class="ml-0 mt-3"
                            @click="novoEndereco">
                            Novo Endereco
                        </v-btn>
                </v-layout>
            </v-flex>
            <v-flex>
                <v-layout column class="ma-3">
                    <h1 class="headline">Resultado</h1>
                    <v-divider />
                    <template v-if="dados">
                        <v-text-field label="ID" readonly
                            v-model="dados.id" />
                        <v-text-field label="Logradouro" readonly
                            v-model="dados.logradouro" />
                        <v-text-field label="CEP" readonly
                            v-model="dados.CEP" />
                        <v-text-field label="Bairro" readonly
                            v-model="dados.bairro" />
                        <v-text-field label="Cidade" readonly
                            v-model="dados.cidade" />
                        <v-text-field label="Estado" readonly
                            v-model="dados.estado" />
                        <v-text-field label="País" readonly
                            v-model="dados.pais" />
                    </template>
                </v-layout>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
import Erros from '../comum/Erros'
import gql from 'graphql-tag'

export default {
    components: { Erros },
    data() {
        return {
            endereco: {},
            dados: null,
            erros: null
        }
    },
    methods: {
        novoPEndereco() {
            this.$api.mutate({
                mutation: gql`mutation (
                    $nome: String
                    $rotulo: String
                ) {
                    novoPerfil (
                        dados: { 
                            nome: $nome
                            rotulo: $rotulo
                        }
                    ) { 
                        id nome rotulo
                    }
                }`,
                variables: {
                    nome: this.perfil.nome,
                    rotulo: this.perfil.rotulo,
                },
            }).then(resultado => {
                this.dados = resultado.data.novoPerfil
                this.perfil = {}
                this.erros = null
            }).catch(e => {
                this.erros = e
            })
        }
    }
}
</script>

<style>

</style>
