	FIX(@RELATIVE("AC005",0),@RELATIVE("AC006",0),@RELATIVE("AC007",0),@RELATIVE("AC008",0),@RELATIVE("AC012",0),@RELATIVE("AC013",0),@RELATIVE("AC014",0),@RELATIVE("AC019",0),@RELATIVE("AC020",0),@RELATIVE("AC021",0),@RELATIVE("AC023",0),@RELATIVE("AC025",0),@RELATIVE("AC026",0),@RELATIVE("AC028",0),@RELATIVE("AC032",0),@RELATIVE("AC033",0),@RELATIVE("AC034",0),@RELATIVE("AC035",0),@RDESCENDANTS("BTL"))
			FIX(@RELATIVE("Entity",0),@RELATIVE("Product",0))
								CLEARDATA "Alloc";
							ENDFIX
						
							FIX(@REMOVE(@RELATIVE("All_Product",0),@LIST(@RELATIVE("PD799",0),"NonProduct")))
									FIX(@ATTRIBUTE("All"))
										"Alloc"(
												SALESVOL_GEN3=@ANCESTVAL("Product",3,"All_Entity"->"Sales Vol HL"->"Alloc Basis")-@ANCESTVAL("Product",3,"EXP"->"Sales Vol HL"->"Alloc Basis");
												SALESVOL_LEV0="All_Entity"->"Sales Vol HL"->"Alloc Basis"-"EXP"->"Sales Vol HL"->"Alloc Basis";
												
												IF(SALESVOL_GEN3<>#MISSING AND SALESVOL_GEN3<>0)
														"Alloc"="Alloc"+SALESVOL_LEV0/ SALESVOL_GEN3 * "Input"->@MEMBER(@NAME(@CONCATENATE (@NAME(@CONCATENATE ("SAPB-",@NAME (@SUBSTRING (@NAME (@ANCEST("Product",3)),2)))),@NAME("0-0000"))));
												ELSEIF((SALESVOL_GEN3==#MISSING OR SALESVOL_GEN3==0) AND @ISUDA("Product","Default_Subbrand_Input"))
														"Alloc"="Alloc"+"Input"->@MEMBER(@NAME(@CONCATENATE (@NAME(@CONCATENATE ("SAPB-",@NAME (@SUBSTRING (@NAME (@ANCEST("Product",3)),2)))),@NAME("0-0000"))));
												ELSEIF((SALESVOL_GEN3==#MISSING OR SALESVOL_GEN3==0) AND NOT(@ISUDA("Product","Default_Subbrand_Input")))
														"Alloc"="Alloc"+#MISSING;
												ENDIF
												)
									ENDFIX
									FIX(@ATTRIBUTE("HOD"))
										"Alloc"(
												SALESVOL_GEN3=@MDANCESTVAL(2,"Entity",3,"Product",3,"Sales Vol HL"->"Alloc Basis");
												SALESVOL_LEV0=@ANCESTVAL("Entity",3,"Sales Vol HL"->"Alloc Basis");
												
												IF(SALESVOL_GEN3<>#MISSING AND SALESVOL_GEN3<>0)
														"Alloc"="Alloc"+SALESVOL_LEV0/ SALESVOL_GEN3 * "Input"->@MEMBER(@NAME(@CONCATENATE (@NAME(@CONCATENATE ("SAPB-",@NAME (@SUBSTRING (@NAME (@ANCEST("Product",3)),2)))),@NAME("0-0000"))));
												ELSEIF((SALESVOL_GEN3==#MISSING OR SALESVOL_GEN3==0) AND @ISUDA("Product","Default_Subbrand_Input"))
														"Alloc"="Alloc"+"Input"->@MEMBER(@NAME(@CONCATENATE (@NAME(@CONCATENATE ("SAPB-",@NAME (@SUBSTRING (@NAME (@ANCEST("Product",3)),2)))),@NAME("0-0000"))));
												ELSEIF((SALESVOL_GEN3==#MISSING OR SALESVOL_GEN3==0) AND NOT(@ISUDA("Product","Default_Subbrand_Input")))
														"Alloc"="Alloc"+#MISSING;
												ENDIF
												)
									ENDFIX
									FIX(@ATTRIBUTE("ASM"))
										"Alloc"(
												SALESVOL_GEN3=@MDANCESTVAL(2,"Entity",4,"Product",3,"Sales Vol HL"->"Alloc Basis");
												SALESVOL_LEV0=@ANCESTVAL("Entity",4,"Sales Vol HL"->"Alloc Basis");
												
												IF(SALESVOL_GEN3<>#MISSING AND SALESVOL_GEN3<>0)
														"Alloc"="Alloc"+SALESVOL_LEV0/ SALESVOL_GEN3 * "Input"->@MEMBER(@NAME(@CONCATENATE (@NAME(@CONCATENATE ("SAPB-",@NAME (@SUBSTRING (@NAME (@ANCEST("Product",3)),2)))),@NAME("0-0000"))));
												ELSEIF((SALESVOL_GEN3==#MISSING OR SALESVOL_GEN3==0) AND @ISUDA("Product","Default_Subbrand_Input"))
														"Alloc"="Alloc"+"Input"->@MEMBER(@NAME(@CONCATENATE (@NAME(@CONCATENATE ("SAPB-",@NAME (@SUBSTRING (@NAME (@ANCEST("Product",3)),2)))),@NAME("0-0000"))));
												ELSEIF((SALESVOL_GEN3==#MISSING OR SALESVOL_GEN3==0) AND NOT(@ISUDA("Product","Default_Subbrand_Input")))
														"Alloc"="Alloc"+#MISSING;
												ENDIF
												)
									ENDFIX
									FIX(@ATTRIBUTE("CC"))
										"Alloc"(
												SALESVOL_GEN3=@ANCESTVAL("Product",3,"Sales Vol HL"->"Alloc Basis");
												SALESVOL_LEV0="Sales Vol HL"->"Alloc Basis";
												
												IF(SALESVOL_GEN3<>#MISSING AND SALESVOL_GEN3<>0)
														"Alloc"="Alloc"+SALESVOL_LEV0/ SALESVOL_GEN3 * "Input"->@MEMBER(@NAME(@CONCATENATE (@NAME(@CONCATENATE ("SAPB-",@NAME (@SUBSTRING (@NAME (@ANCEST("Product",3)),2)))),@NAME("0-0000"))));
												ELSEIF((SALESVOL_GEN3==#MISSING OR SALESVOL_GEN3==0) AND @ISUDA("Product","Default_Subbrand_Input"))
														"Alloc"="Alloc"+"Input"->@MEMBER(@NAME(@CONCATENATE (@NAME(@CONCATENATE ("SAPB-",@NAME (@SUBSTRING (@NAME (@ANCEST("Product",3)),2)))),@NAME("0-0000"))));
												ELSEIF((SALESVOL_GEN3==#MISSING OR SALESVOL_GEN3==0) AND NOT(@ISUDA("Product","Default_Subbrand_Input")))
														"Alloc"="Alloc"+#MISSING;
												ENDIF
												)
									ENDFIX

									
							ENDFIX
							
							FIX(@ATTRIBUTE("All"),@ATTRIBUTE("HOD"),@ATTRIBUTE("ASM"),@ATTRIBUTE("CC"))
									FIX(@REMOVE(@ATTRIBUTE("Subbrand_Input"),"SAPB-7990-0000"))
											"Alloc"("Alloc"="Alloc"-"Input";)
									ENDFIX						
							ENDFIX
					ENDFIX
						
				ENDFIX
		ENDFIX
				
ENDFIX

FIX(&Alloc_Year)
	FIX(&Alloc_Month)
		FIX("Actual")
			FIX(@RELATIVE("Product",0),@RELATIVE("Layer",0),@RELATIVE("Entity",0),@RELATIVE("Account",0))
				DATACOPY "Final" to "external";
				DATACOPY "Final" to "B2B";
			ENDFIX		
		ENDFIX
	ENDFIX

ENDFIX

FIX(&Alloc_Month)
	FIX("Final","external","B2B")
		FIX(@RELATIVE("Product",0),@RELATIVE("Layer",0),@RELATIVE("Entity",0),@RELATIVE("Account",0))
			DATACOPY "FY08"->"Actual" to "FY09"->"LY_ACT";
			DATACOPY "FY09"->"Actual" to "FY10"->"LY_ACT";
			DATACOPY "FY10"->"Actual" to "FY11"->"LY_ACT";
			DATACOPY "FY11"->"Actual" to "FY12"->"LY_ACT";
		ENDFIX
	ENDFIX

ENDFIX

FIX(&Alloc_Year)
	FIX("Final","external","B2B","Actual","LY_ACT")
		CALC DIM("Account","Period","Entity","Product","Layer");
	ENDFIX
ENDFIX
