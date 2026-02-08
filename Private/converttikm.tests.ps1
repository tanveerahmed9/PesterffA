BeforeAll {
    # Import the function to be tested
    . $PSScriptRoot/converttokm.ps1
}

Describe "ConvertToKm" {
    Context "Basic conversions" {
        It "Should convert 1 mile to kilometers" {
            ConvertToKm -Miles 1 | Should -Be 1.60934
        }

        It "Should convert 0 miles to 0 kilometers" {
            ConvertToKm -Miles 0 | Should -Be 0
        }

        It "Should convert 10 miles to approximately 16.0934 kilometers" {
            ConvertToKm -Miles 10 | Should -Be 16.0934
        }

        It "Should convert 100 miles to approximately 160.934 kilometers" {
            ConvertToKm -Miles 100 | Should -Be 160.934
        }
    }

    Context "Negative numbers" {
        It "Should convert negative miles to negative kilometers" {
            ConvertToKm -Miles -5 | Should -Be -8.0467
        }

        It "Should convert -1 mile correctly" {
            ConvertToKm -Miles -1 | Should -Be -1.60934
        }
    }

    Context "Decimal numbers" {
        It "Should convert 0.5 miles to kilometers" {
            ConvertToKm -Miles 0.5 | Should -Be 0.80467
        }

        It "Should convert 2.5 miles to kilometers" {
            ConvertToKm -Miles 2.5 | Should -Be 4.02335
        }

        It "Should handle very small decimal values" {
            ConvertToKm -Miles 0.01 | Should -Be 0.0160934
        }
    }

    Context "Large numbers" {
        It "Should convert 1000 miles to kilometers" {
            ConvertToKm -Miles 1000 | Should -Be 1609.34
        }

        It "Should convert very large numbers" {
            ConvertToKm -Miles 1000000 | Should -Be 1609340
        }
    }

    Context "Precision" {
        It "Should return a double type" {
            $result = ConvertToKm -Miles 5
            $result | Should -BeOfType [double]
        }

        It "Should maintain precision for the conversion multiplier" {
            $result = ConvertToKm -Miles 1
            # Verify the exact multiplier used
            $result | Should -Be 1.60934
        }
    }

    Context "Parameter validation" {
        It "Should require the Miles parameter" {
            { ConvertToKm } | Should -Throw
        }

        It "Should accept pipeline input for Miles parameter" {
            5 | ConvertToKm | Should -Be 8.0467
        }
    }
}
